#!/bin/bash

echo "Give the current script the ability to switch environments."
eval "$(conda shell.bash hook)"

if conda env list | grep -q "^syri_env"; then
    echo "The syri_env environment already exists."
    if [[ "$CONDA_DEFAULT_ENV" != "syri_env" ]]; then
        echo "Your current environment is $CONDA_DEFAULT_ENV."
        read -p "Do you want to switch to the syri_env environment? (y/n): " answer
        case ${answer:0:1} in
        y|Y)
            echo "Switching to the syri_env environment..."
            conda activate syri_env
            echo "Switching completed successfully. Your current environment is $CONDA_DEFAULT_ENV."
            ;;
        n|N)
            echo "A refusal was received. Switching to the syri_env environment will not complete."
            exit 1
            ;;
        *)
            echo "Unknown answer."
            exit 1
            ;;
        esac
    else
        echo "The syri_env environment is already activated"
    fi
else
    echo "The syri_env environment not exists."
    read -p "Do you want to create the syri_env environment? (y/n): " answer
    case ${answer:0:1} in
    y|Y)
        echo "Creating the syri_env environment and activate it."
        conda env create -f environment.yml
        conda activate syri_env
        echo "The syri_env environment has been successfully created and activated."
        ;;
    n|N)
        echo "A refusal was received. The syri_env environment will not be created."
        exit 1
        ;;
    *)
        echo "Unknown answer."
        exit 1
        ;;
    esac
fi
