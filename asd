import itertools

def find_all_paths(matrix, start_point, max_distance):
    n = len(matrix)
    points = list(range(n))
    points.remove(start_point)  
    paths = []

    
    def generate_combinations():
        for r in range(1, n):
            for combination in itertools.permutations(points, r):
                yield (start_point,) + combination + (start_point,)  

    
    def check_path_distance(path):
        distance = sum(matrix[path[i]][path[i+1]] for i in range(len(path)-1))
        if distance <= max_distance:
            paths.append(path)

    
    combinations = generate_combinations()

    
    for combination in combinations:
        check_path_distance(combination)

    return paths


distance_matrix = [
    [0, 10, 15, 20],
    [10, 0, 35, 25],
    [15, 35, 0, 30],
    [20, 25, 30, 0]
]
start_point = 0
max_distance = 20

result = find_all_paths(distance_matrix, start_point, max_distance)
print("Znalezione trasy:")
for path in result:
    print(path)
