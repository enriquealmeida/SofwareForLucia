<?rsa version="1.0" encoding="utf-8"?>
<Configuration>
	<Product Id="Crypto-C ME">
		<Version>RSA BSAFE Crypto-C ME 4.1.2.0 2015-11-30 15:09</Version>
		<ReleaseDate>2015-11-30 15:09</ReleaseDate>
		<ExpDate>""</ExpDate>
		<Copyright>
			Copyright (C) RSA
		</Copyright>
		<Library Id="master">cryptocme</Library>
	</Product>
	<Runtime Id="runtime">
		<LoadOrder>
			<Library Id="ccme_error_info">ccme_error_info</Library>
			<Library Id="ccme_aux_entropy">ccme_aux_entropy</Library>
			<Library Id="ccme_base">ccme_base</Library>
			<Library Id="ccme_asym">ccme_asym</Library>
			<Library Id="ccme_ecc_accel_fips">ccme_ecc_accel_fips</Library>
			<Library Id="ccme_ecc">ccme_ecc</Library>
			<Library Id="ccme_base_non_fips">ccme_base_non_fips</Library>
			<Library Id="ccme_ecc_accel_non_fips">ccme_ecc_accel_non_fips</Library>
			<Library Id="ccme_ecc_non_fips">ccme_ecc_non_fips</Library>
		</LoadOrder>
		<StartupConfig>
			<SelfTest>OnLoad</SelfTest>
		</StartupConfig>
	</Runtime>
	<Signature URI="#ccme_error_info" Algorithm="FIPS140_INTEGRITY">MDwCHGXc80BDDMiivJM2b0hLQ7dOizjFbxx68yWKH7ACHBbitWNidHZM+QG552KJUMtDLr5X6rkdrO+MHuo=</Signature>
	<Signature URI="#ccme_aux_entropy" Algorithm="FIPS140_INTEGRITY">MDwCHA51Xyn9Nh6b8EgX/zQO4LbNFqGvnM7nWYhA518CHCxQ0da3uHSuyAmy2GR+bIfEz4iOw9WDxoHHgpg=</Signature>
	<Signature URI="#ccme_base" Algorithm="FIPS140_INTEGRITY">MD0CHQC1oD3IcZCAQok3mdz6lQPSRfgSaD2J0lbHR0M9AhwRvSOj3CLfWqJY1WbQyhYj++MGYtf5OjuY3J0b</Signature>
	<Signature URI="#ccme_asym" Algorithm="FIPS140_INTEGRITY">MDwCHGzIHL9W0dnQ94OgNxwyFkZzJOwyZqMvxPSCydkCHCMlu1z3+4gs36d706jbhJ+1K2QUkPWiOT/AugM=</Signature>
	<Signature URI="#ccme_ecc_accel_fips" Algorithm="FIPS140_INTEGRITY">MDwCHB+BFtb7acDF93T3TBY0oh61NqPwDNbeDjtcWh8CHB5IBagTuGh7Id/DFF3reijKroZsN0alyM1L3Pg=</Signature>
	<Signature URI="#ccme_ecc" Algorithm="FIPS140_INTEGRITY">MD0CHQCIz1JTdqs9YB3uV6lgAvUGitKFmrdbX+qqAyUxAhxN3dLgchbQPB1jkhDoZZd2nf+9aTaNnQZ7TdCS</Signature>
	<Signature URI="#ccme_base_non_fips" Algorithm="FIPS140_INTEGRITY">MDwCHHyf8VnEoOGSHwHZLG+IEjYKcKnhC7YfvTQ2074CHDsKsYqDizIyma9Vk6rgFea3btu3J3cyfcL8CFQ=</Signature>
	<Signature URI="#ccme_ecc_accel_non_fips" Algorithm="FIPS140_INTEGRITY">MDwCHFYJaXgPoq/RZTfaNWnfEkMaehEUcXCiiRtyTw0CHFBAVDHUBm5MurgBen9IWZseaZvxiaaKpoSGrxw=</Signature>
	<Signature URI="#ccme_ecc_non_fips" Algorithm="FIPS140_INTEGRITY">MD0CHQC6qsR4OmEvVeJvWGJYu8vggVIkaD4qDAvmLUObAhwBSfRfNgRL2v3LGxvJv/a9lC4HGpjSpCph5231</Signature>
	<Signature URI="#master" Algorithm="FIPS140_INTEGRITY">MD4CHQCWyc3yfdwiExrXel34aBLc7c7PWqFmUWDxwdnOAh0Ao8jxutpSWrnRmsM2ZtMmF/jYh4Pv4gixpTddXg==</Signature>
	<Signature URI="#Crypto-C ME" Algorithm="FIPS140_INTEGRITY">MDwCHElecLIuhWilqwp608pW/iAImblb1isyO5yWYAYCHGPMiPcyUm4gGWpo+jMzhK0+0vcdsKYpJ9Yxayg=</Signature>
	<Signature URI="#runtime" Algorithm="FIPS140_INTEGRITY">MD0CHQC3PvRRixhuZB4J68juAS1wWAVtoJ7/4EOA0qeOAhxc7i7dKBn8NN/kAkZhp+0iHyFSIIYaj8zd32a0</Signature>
</Configuration>

