#!/bin/bash

if command -v conda &> /dev/null; then
    echo "conda is already installed."
    echo "Version: $(conda --version)."
else
    echo "conda is not installed."
    read -p "Do you want to install conda? (y/n): " answer
    case ${answer:0:1} in
    y|Y)
        echo "Install the latest version of Miniconda."

        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
        bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda3
        echo 'export PATH="$HOME/miniconda3/bin:$PATH"' >> ~/.bashrc
        source ~/.bashrc
        echo "Miniconda has been installed successfully."
        echo "Version: $(conda --version)."
        rm Miniconda3-latest-Linux-x86_64.sh
        ;;
    n|N)
        echo "A refusal was received. Miniconda will not be installed."
        exit 1
        ;;
    *)
        echo "Unknown answer."
        exit 1
        ;;
    esac
fi
