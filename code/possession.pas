    def possession(self, has_ball: TeamBuilder) -> None:
        oncourt = self.game.on_court(self.game.has_ball.roster)
        touches_ball = self.game.in_current_play(oncourt, self.game.has_ball.roster)

        # TOV
        if self.game.simulate_stat(touches_ball, "TOV"):
            self.game.switch_possession()
            return

        # attempt
        attempt = self.game.shot_attempt(touches_ball)
        if attempt > 0:
            if has_ball.h_or_a == "home":
                self.home_pts += attempt
            else:
                self.away_pts += attempt

            self.game.switch_possession()
        else:
            # Offensive REB
            orb = self.game.home.team_df["ORB"].iloc[0]/100
            if GameTools.step(orb):
                self.possession(self.game.has_ball)
            else:
                self.game.switch_possession()