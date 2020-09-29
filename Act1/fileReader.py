import csv

population_2010 = []
value_errors = ['--', 'NA']
country_exceptions = ['World', 'Country', 'Asia & Oceania', 'Africa', 'Europe',
                      'Central & South America', 'North America', 'Eurasia', 'Middle East']
path = r'D:\Users\enriq\TEC\Semestre 3\Internet of Things\IoT_GitHub\Act1\populationbycountry19802010millions.csv'
with open(path, newline='') as file:
    spamreader = csv.reader(file, delimiter=',')
    for row in spamreader:
        if row[-1] not in value_errors and row[0] not in country_exceptions:
            population_2010.append([float(row[-1]), row[0]])

population_2010.sort(reverse=True)
print("Paises mas poblados en 2010")
print(population_2010[:5])

path2 = r'D:\Users\enriq\TEC\Semestre 3\Internet of Things\IoT_GitHub\Act1\greenhouse_gas_inventory_data_data.csv'

gases_2010 = []
check = False
with open(path2, newline='') as file2:
    reader = csv.reader(file2, delimiter=',')
    for row in reader:
        if row[1] == '2010' and row[0] != 'European Union' and row[3] == 'greenhouse_gas_ghgs_emissions_including_indirect_co2_without_lulucf_in_kilotonne_co2_equivalent':
            gases_2010.append([float(row[2]), row[0]])


gases_2010.sort(reverse=True)
print(gases_2010[:5])
