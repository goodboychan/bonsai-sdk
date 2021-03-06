# 1.0 INSTALLATION

There are a few things you must install (outside of the Bonsai Platform) to run the EnergyPlus simulator. As of the latest release of BCVTB there is no longer support for 32-bit systems, so make sure to download 64-bit versions of the JDK and EnergyPlus as well.

### 1.1 Install JDK
Download and install the correct JDK for your system at http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

### 1.2 Install EnergyPlus
Download and install ONLY V8.5 (scroll to end of page), this simulator will not yet work on the latest release of EnergyPlus. https://github.com/NREL/EnergyPlus/releases/tag/v8.5.0

### 1.3 Install Building Controls Virtual Test Bed (BCVTB)

**Note on Windows:** You will need to first make a new folder at C:\bcvtb before running the .jar and make sure to change the install location to C:\bcvtb, otherwise it won't have the correct write permissions.

Download and install the correct version at https://simulationresearch.lbl.gov/bcvtb/Download

### 1.4 Set Environment Variables

**Windows**

Go to System -> Advanced system settings -> Environment Variables to set these in Windows.

**Example Locations in Windows**

| Variable       | Value                                      |
| -------------- | ------------------------------------------ |
| BCVTB_HOME     | C:\bcvtb                                   |
| BCVTB_JNI_DIR  | C:\Program Files\Java\jdk1.8.0_121\include |
| ENERGYPLUS_BIN | C:\EnergyPlusV8-5-0                        |
| JAVA_HOME      | C:\Program Files\Java\jdk1.8.0_121\bin     |


**macOS/Linux**

Use `export` in macOS or Linux to set these variables into your PATH, making sure the locations are the same as where you installed to. You may wish copy and paste the following (example macOS locations) into your `.bash_profile` for future use.

```
export BCVTB_HOME=/Applications/bcvtb
export BCVTB_JNI_DIR=/usr/bin/java/include
export ENERGYPLUS_BIN=/Applications/EnergyPlus-8-5-0
export JAVA_HOME=/usr/local/java
```

### 1.5 Install the Bonsai CLI

Install the Bonsai CLI by following our [detailed CLI installation guide](https://docs.bons.ai/guides/cli-install-guide.html)

### 1.6 Install Dependencies

Download this energyplus-sample source code from Github and navigate into its folder in your command prompt. *energyplus_simulator.py* has various dependencies that need to be installed before the simulator can run. Run `pip install -r requirements.txt` to install these.

# 3.0 HOW TO TRAIN YOUR BRAIN

### 3.1 Create a BRAIN
If you haven't already created a BRAIN on beta.bons.ai, create one now via the Bonsai CLI with `bonsai create <your_brain>`.

### 3.2 Load Inkling
Load the energyplus.ink Inkling file into your brain with `bonsai push`.

### 3.3 Enable Training Mode
Enable training mode for your brain with `bonsai train start`.

### 3.4 Connect EnergyPlus
Connect the energyplus simulator for training. Please note that training may take many hours. Run `python energyplus_simulator.py`.

**Note:** If you restart training, you may need to run `run.bat clean` (Windows) or `run.sh clean` (macOS/Linux) to cleanup your local drive from the previous run.

### 3.5 Stop Training
When training has hit a sufficient accuracy, disable training mode with `bonsai train stop`.

# 4.0 HOW TO USE YOUR BRAIN

### 4.1 Run the simulator
This is done by using predictions from your brain on the latest version (or another version specified) with `python energyplus_simulator.py --predict`.