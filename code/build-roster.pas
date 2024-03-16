for _, row in pl_df.iterrows():
    test = row["position"] and row["player"] in self.individual_df['player'].unique()
    if test:
        position = getattr(self.roster, row["position"])
        position.append(Player(self.individual_df
	    .loc[self.individual_df['player'] == 
		row["player"], :], row["player"], row["GP"], 
		row["depth"], row["MPG"]))