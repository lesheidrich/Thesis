    def shot_attempt(self, players: List[Player], shooter_w_mult: float = 2) -> bool:
        # who takes shot
        w = [p.player_w + (p.FGA + p.threePA) / 200 for p in players]
        shooter = GameTools.weighted_random_sample(players, w, 1, shooter_w_mult)[0]
        # type of shot attempted
        shot_points_w = [shooter.FGA, shooter.threePA]
        points = GameTools.weighted_random_sample([2, 3], shot_points_w, 1, 1)[0]
        if points == 2:
            return GameTools.step(shooter.FGpercent/100) * points
        return GameTools.step(shooter.threePpercent/100) * points