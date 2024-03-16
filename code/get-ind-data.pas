def get_individual_data(self, team_short:str, game_date:str,
			game_type:str) -> pd.DataFrame:
	condition = (f'team="{team_short}" AND '
		f'date >= "{int(game_date[:4]) - 1}{game_date[4:]}" '
		f'AND date < "{game_date}" ORDER BY date')
	table = f"individual_games_{game_type}"
	return self.get_data(condition, table)