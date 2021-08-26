System Requirements:
Miniconda (installed to user folder)

How to run:
1.install miniconda to user folder
2.run "SetupCondaEnv.bat" and "SetupDatabaseServer.bat" once to setup the anaconda environment named "pixelenv" used by the program and setup the database respectively.
3.Run the servers with "StartServers.bat" in the src folder
4.Start the client program by running "StartGUIClient.bat" batch script in the src folder

Developer Notes:
to create a conda environment from the provided environment.yml file
run : "conda env create -f environment.yml"
to update the conda environment with a new environment.yml file
run : "conda env update -n pixelenv -f environment.yml"
