import csv
import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd

# Read CSV file into a pandas DataFrame
csv_file = "./scanning_results.csv"

# Load the data into a pandas DataFrame
df = pd.read_csv(csv_file)

# Drop the 'file name' column as it is not needed for plotting
df = df.drop(columns=['file name'])

def plot_vulnerabilities_vs_apk():
    # Count how many "1"s are in each column (each vulnerability)
    vulnerability_count = df.sum(axis=0)
    
    # Filter out vulnerabilities with 0 count
    vulnerability_count = vulnerability_count[vulnerability_count > 0]
    
    # Sort vulnerabilities by count in descending order
    vulnerability_count = vulnerability_count.sort_values(ascending=False)
    
    # Plot the bar graph
    plt.figure(figsize=(12, 6))
    vulnerability_count.plot(kind='bar', color=sns.color_palette("Set2", len(vulnerability_count)))
    plt.title('Vulnerabilities vs Number of APKs')
    plt.xlabel('Vulnerabilities')
    plt.ylabel('Count (Number of APKs)')
    plt.xticks(rotation=45, ha='right', fontsize=10)
    plt.tight_layout()
    plt.show()

def plot_vulnerability_distribution():
    vulnerability_count = df.sum(axis=0)  # Sum of 1s in each column (vulnerability)
    
    # Only consider vulnerabilities with at least 1 occurrence
    vulnerability_count = vulnerability_count[vulnerability_count > 0]
    
    plt.figure(figsize=(8, 8))
    vulnerability_count.plot(kind='pie', autopct='%1.1f%%', colors=sns.color_palette("Set3", len(vulnerability_count)))
    plt.title('Vulnerability Distribution Across APKs')
    plt.ylabel('')  # Hide the y-label as it's not necessary for pie chart
    plt.tight_layout()
    plt.show()

def plot_vulnerability_correlation():
    # Remove columns with all zeros
    df_filtered = df.loc[:, df.nunique() > 1]

    # Calculate correlation matrix
    correlation_matrix = df_filtered.corr()

    # Plot the heatmap
    plt.figure(figsize=(12, 8))
    sns.heatmap(
        correlation_matrix,
        annot=True,
        cmap="coolwarm",
        fmt=".2f",
        linewidths=0.5,
        cbar=True,
        square=True
    )
    plt.title('Vulnerability Correlation Matrix (Filtered)')
    plt.tight_layout()
    plt.show()




# Call the functions to display the graphs
plot_vulnerabilities_vs_apk()
plot_vulnerability_distribution()
plot_vulnerability_correlation()
