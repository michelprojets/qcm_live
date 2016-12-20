<?php 
echo("<tr><td><input class=\"colonne1 multiple\" type=\"button\" name=\"question\" onclick=\"self.location.href='index.php?controle=professeur&action=selectQuestions&param=" . $q['id_quest'] . "'\" ></td>");
				echo("<td>" . " " . "</td>");
				echo("<td>" . $q['id_quest'] . "</td>");
				echo("<td>" . $q['texte'] . "</td>");
				echo("<td>");
					echo ('<table>');
						echo('<tr>');
							afficherReponsesEtu($q); // affichage des réponses une par une indépendamment
						echo('</tr>');
					echo ('</table>');
				echo("</td>");
				echo("</tr>");
?>