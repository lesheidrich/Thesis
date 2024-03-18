    @staticmethod
    def weighted_random_sample(population: List, weights: List, k: int, weight_multiplier: float) -> List:
        result = set()

        while len(result) < k:
            w = [math.pow(_, weight_multiplier) for _ in weights]
            i = random.choices(range(len(population)), weights=w)[0]
            if population[i] not in result:
                result.add(population[i])
        return list(result)