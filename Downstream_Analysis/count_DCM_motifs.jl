using ArgParse
using BioSequences
using FASTX
using Plots
using Random


function parse_commandline()
    s = ArgParseSettings(
	description = "This script aims at counting the number of DCM motifs in a sequence provided as input." *
	"Use --filepath to specify the input directory."
	)
    @add_arg_table s begin
        "--filepath"
            help = "Path to fasta file (default: /path_to_Zebrafish_Genome_Assembly/Genome_Assembly.fa)"
            default = "/path_to_Zebrafish_Genome_Assembly/Genome_Assembly.fa"
    end

    return parse_args(ARGS, s)

end




function count_motifs(filepath)
    motif1 = ExactSearchQuery(dna"CCAGG")
    motif2 = ExactSearchQuery(dna"CCTGG")
    counts = 0

    freader = FASTAReader(open(filepath))

    for record in freader
        all_match = true
        seq = sequence(LongDNA{4}, record)
        p1 = findall(motif1, seq)
        p2 = findall(motif2, seq)

        for r in p1
            all_match = all_match && String(seq[r]) == "CCAGG"
        end
        for r in p2
            all_match = all_match && String(seq[r]) == "CCTGG"
        end

        counts += length(p1) + length(p2)
    end

    return counts
end



function main()
	parsed_arg = parse_commandline()
	filepath = parsed_arg["filepath"]
	println(count_motifs(filepath))
end


main()
