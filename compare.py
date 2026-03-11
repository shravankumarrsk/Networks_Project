import matplotlib.pyplot as plt

# Read client loss ratio values for sv0-ps512
with open('summarizedData/sv0-ps512.csv', 'r') as f:
    data512 = list(map(float, f.read().strip().split()))

# Read client loss ratio values for sv0-ps1500
with open('summarizedData/sv0-ps1500.csv', 'r') as f:
    data1500 = list(map(float, f.read().strip().split()))

# Node counts from 2 to 30
nodes = list(range(2, 31))

# Plotting
plt.figure(figsize=(12, 7))

# Plot for Packet Size 512
plt.plot(nodes, data512, marker='o', linestyle='-', color='blue', label='512 bytes (No RTS/CTS)', markersize=8)

# Plot for Packet Size 1500
plt.plot(nodes, data1500, marker='s', linestyle='--', color='green', label='1500 bytes (RTS/CTS Enabled)', markersize=8)

# Graph Settings
plt.title('Client Loss Ratio vs Number of Nodes', fontsize=18)
plt.xlabel('Number of Nodes', fontsize=14)
plt.ylabel('Client Loss Ratio (%)', fontsize=14)
plt.grid(True, linestyle='--', alpha=0.7)
plt.legend(fontsize=12)
plt.xticks(nodes, fontsize=10)
plt.yticks(fontsize=10)
plt.tight_layout()

# Save the figure as PDF
plt.savefig('summarizedData/client_loss_comparison.pdf')

# Display the plot
plt.show()
