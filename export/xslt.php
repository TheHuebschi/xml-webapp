<?php

/**
 * perform XSLT transformation with PHP
 * @author Roland Christen <roland.christen@hslu.ch>
 * API: http://php.net/manual/en/class.xsltprocessor.php
 */

// load XML
$data = file_get_contents($xml_file_path);
$xml = new DOMDocument();
$xml->loadXML($data);

// load XSL
$xsl = new DOMDocument();
$xsl->load($xsl_file_path);

// transform
$processor = new XSLTProcessor();
$processor->importStylesheet($xsl);
$processor->setParameter('', 'challengeId', $id);
$dom = $processor->transformToDoc($xml);

// send result to client
$dom->save($fo_file_path);