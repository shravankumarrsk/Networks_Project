#!/bin/bash
# Location: ~/ns-3-dev/main.sh

# Step 0: Build NS-3
./ns3 build

# Step 1: Create required directories
mkdir -p DC_Mini_Project/flowData/sv0-ps512
mkdir -p DC_Mini_Project/animData/sv0-ps512
mkdir -p DC_Mini_Project/flowData/sv0-ps1500
mkdir -p DC_Mini_Project/animData/sv0-ps1500
mkdir -p DC_Mini_Project/analyzedData/sv0-ps512
mkdir -p DC_Mini_Project/analyzedData/sv0-ps1500
mkdir -p DC_Mini_Project/summarizedData

# Step 2: Run simulations without RTS/CTS (packetSize = 512)
echo "Running simulations (Packet Size 512, RTS/CTS disabled)..."
for n in {2..30}; do
    echo "Running simulation with $n nodes..."
    ./ns3 run "scratch/main --nNodes=$n --packetSize=512 --maxPackets=10 --interval=1 --verbose=false --pcap=false --collectData=false"
    mv final-${n}-nodes.xml DC_Mini_Project/flowData/sv0-ps512/
    mv anim-${n}-nodes.xml DC_Mini_Project/animData/sv0-ps512/
done

# Step 3: Run simulations with RTS/CTS (packetSize = 1500)
echo "Running simulations (Packet Size 1500, RTS/CTS enabled)..."
for n in {2..30}; do
    echo "Running simulation with $n nodes (RTS/CTS)..."
    ./ns3 run "scratch/main --nNodes=$n --packetSize=1500 --maxPackets=10 --interval=1 --verbose=false --pcap=false --collectData=false"
    mv final-${n}-nodes.xml DC_Mini_Project/flowData/sv0-ps1500/
    mv anim-${n}-nodes.xml DC_Mini_Project/animData/sv0-ps1500/
done


echo "All simulations complete."
