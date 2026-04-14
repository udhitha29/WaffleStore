<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">

		<html>

			<head>

				<style>

					body{
					background:#ffe6f2;
					font-family:Arial;
					text-align:center;
					}

					h2{
					color:#ff3399;
					}

					table{
					margin:auto;
					border-collapse:collapse;
					width:60%;
					background:white;
					border-radius:10px;
					}

					th{
					background:#ff99cc;
					padding:10px;
					}
					.backBtn{
					margin-top:30px;
					padding:12px 25px;
					background:#66ccff;
					color:white;
					border:none;
					border-radius:25px;
					font-size:16px;
					cursor:pointer;
					}

					.backBtn:hover{
					background:#33bbff;
					}

					td{
					padding:10px;
					}

					tr:nth-child(even){
					background:#ffe6f2;
					}

				</style>

			</head>

			<body>

				<h2>💖 Confirmed Orders 🍕</h2>
				

				<table border="1">

					<tr>
						<th>📦 Order ID</th>
						<th>💰 Amount</th>
						<th>📌 Status</th>
						<th>📅 Date</th>
					</tr>

					<xsl:for-each select="orders/order">

						<tr>
							<td>
								<xsl:value-of select="id"/>
							</td>
							<td>
								₹<xsl:value-of select="amount"/>
							</td>
							<td>
								<xsl:value-of select="status"/>
							</td>
							<td>
								<xsl:value-of select="date"/>
							</td>
						</tr>
						
					</xsl:for-each>

				</table>
				<a href="home.jsp">
					<button class="backBtn">Back to Home</button>
				</a>

			</body>
		</html>

	</xsl:template>

</xsl:stylesheet>