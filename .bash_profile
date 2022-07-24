
# ln -s ~/.config/bash/.bash_profile ~/.config/.bash_profile

# Set the JAVA_HOME path and include it's binaries in path
export JAVA_HOME=/usr/lib/jvm/java-13-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

# Set the FLUTTER_HOME path and include it's binaries in path
export FLUTTER_HOME=/home/$(whoami)/Tools/sdk-flutter
export PATH=$FLUTTER_HOME/bin:$PATH
