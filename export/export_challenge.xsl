<?xml version="1.0" ?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:param name="challengeId" select="''" />
	<xsl:param name="companyId"
		select="challenges/challenge[@id = $challengeId]/@companyId" />
	<xsl:template match="/">
		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master
					master-name="challenge-export" page-height="29.7cm"
					page-width="21cm" margin-top="1cm" margin-bottom="1cm"
					margin-left="2.5cm" margin-right="2.5cm">
					<fo:region-body margin-top="1cm" />
					<fo:region-before extent="2cm" />
					<fo:region-after extent="1cm" />
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence
				master-reference="challenge-export">

				<fo:static-content flow-name="xsl-region-before">
					<fo:block text-align="center" font-size="10pt">
						<xsl:value-of
							select="challenges/challenge[@id = $challengeId]/title" />
					</fo:block>
				</fo:static-content>

				<fo:static-content flow-name="xsl-region-after">
					<fo:block text-align="center" font-size="10pt">
						<fo:page-number />
					</fo:block>
				</fo:static-content>

				<fo:flow flow-name="xsl-region-body">
					<xsl:apply-templates
						select="challenges/challenge[@id = $challengeId]" />
				</fo:flow>

			</fo:page-sequence>
		</fo:root>
	</xsl:template>

	<xsl:template match="challenge">
		<fo:block font-size="22pt" font-family="sans-serif"
			line-height="24pt" space-after.optimum="20pt" background-color="grey"
			color="white" text-align="center" padding-top="3cm" margin-top="5cm"
			padding-bottom="3cm" margin-bottom="3cm">
			<xsl:value-of select="title" />
		</fo:block>
		<fo:block font-size="11pt" font-family="sans-serif"
			line-height="15pt" color="black" text-align="left" padding-top="5pt"
			padding-bottom="5pt">
			von
			<xsl:value-of
				select="document('https://xml.temperli.online/database/companies.xml')/companies/company[@id = $companyId]/name" />
		</fo:block>
		<fo:block font-size="11pt" font-family="sans-serif"
			line-height="15pt" color="black" text-align="left" padding-top="5pt"
			padding-bottom="5pt">
			<xsl:value-of select="description" />
		</fo:block>
		<fo:block font-size="11pt" font-family="sans-serif"
			line-height="15pt" color="black" text-align="left" padding-top="5pt"
			padding-bottom="5pt">
			Gewinnpreis:
			<xsl:value-of select="price" />
		</fo:block>
		<xsl:apply-templates
			select="registrations/registration" />
	</xsl:template>

	<xsl:template match="registration">
		<xsl:param name="communityId" select="@communityId" />
		<xsl:value-of select="$communityId" />
		<fo:block font-size="19pt" font-family="sans-serif"
			line-height="24pt" space-after.optimum="20pt" color="black"
			text-align="center" padding-top="5pt" margin-top="1.5cm" padding-bottom="5pt"
			page-break-before="always">
			<xsl:value-of select="title" />
		</fo:block>
		<fo:block font-size="11pt" font-family="sans-serif"
			line-height="15pt" color="black" text-align="left" padding-top="5pt"
			padding-bottom="5pt">
			Eingereicht von
			<xsl:value-of
				select="document('https://xml.temperli.online/database/communities.xml')/communities/community[@id = $communityId]/name" />
			am
			<xsl:value-of select="date" />
		</fo:block>
		<fo:block font-size="11pt" font-family="sans-serif"
			line-height="15pt" color="black" text-align="left" padding-top="5pt"
			padding-bottom="5pt">
			Anzahl Mitglieder:
			<xsl:value-of
				select="document('https://xml.temperli.online/database/communities.xml')/communities/community[@id = $communityId]/size" />
		</fo:block>
		<fo:block font-size="11pt" font-family="sans-serif"
			line-height="15pt" color="black" text-align="left" padding-top="5pt"
			padding-bottom="5pt">
			<xsl:value-of
				select="document('https://xml.temperli.online/database/communities.xml')/communities/community[@id = $communityId]/description" />
		</fo:block>
		<fo:block font-size="11pt" font-family="sans-serif"
			line-height="15pt" color="black" text-align="left" padding-top="5pt"
			padding-bottom="5pt">
			Ort:
			<xsl:value-of
				select="document('https://xml.temperli.online/database/communities.xml')/communities/community[@id = $communityId]/location" />
		</fo:block>
		<fo:block font-size="11pt" font-family="sans-serif"
			line-height="15pt" color="black" text-align="left" padding-top="5pt"
			padding-bottom="5pt">
			E-Mail:
			<xsl:value-of
				select="document('https://xml.temperli.online/database/communities.xml')/communities/community[@id = $communityId]/email" />
		</fo:block>
		<fo:block font-size="11pt" font-family="sans-serif"
			line-height="15pt" color="black" text-align="left" padding-top="5pt"
			padding-bottom="5pt">
			<xsl:value-of select="description" />
		</fo:block>
		<fo:block>
			<fo:external-graphic src="{pictureLink}"
				padding-top="2cm" content-width="16cm" scaling="uniform" />
		</fo:block>
	</xsl:template>
</xsl:stylesheet>