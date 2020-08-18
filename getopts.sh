while getopts :h opt; do
    case ${opt} in
        h)
            echo "Usage:"
            echo "  pip -h"
            echo "  pip install <package>"
            exit 0
            ;;
        \?)
            echo "Invalid Option: -$OPTARG"
            exit 1
            ;;
        # a)
        #     echo "Now at option a"
        #     echo "Args for option a is $OPTARG"
        #     exit 0
        #     ;;
    esac
done

#this will execute only if option is not passed
subcommand=$1;

case $subcommand in
    install)
        shift; #shift causes the string after install, to be next argument
        package=$1; shift;
        echo "Package is $package";
        while getopts ":t:" opt; do
            case ${opt} in
                t)
                    echo "Parsing option ${opt}"
                    echo "Argument is $OPTARG" #note that we do not exit here, so as to parse argument after option -t
                    echo "Option index is $OPTIND"
                    ;;
                \?)
                    echo "Parsing option ${opt}"
                    echo "Option index is $OPTIND"
                    ;;
                :)
                    echo "Invalid option: -$OPTARG requires an argument"
                    echo "Option index is $OPTIND"
                    # exit 1
                    ;;
            esac
        done
esac