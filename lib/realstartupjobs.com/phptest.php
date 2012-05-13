<?php 

$dbusername="karbin_admin";
$dbpassword="calculus";
$dbname="karbin_startups";
	$con = mysql_connect("localhost",$dbusername,$dbpassword);
	if (!$con)
	  {
	  die('Could not connect: ' . mysql_error());
	  }
	  	mysql_select_db($dbname, $con);

?>
				<?php
			$sql="SELECT * FROM jobs LEFT JOIN companies ON jobs.company_id=companies.id";
			$result=mysql_query($sql); 
		    while($row=mysql_fetch_array($result))
		    { 
  				$job_id=$row['id'];
				$company_id=$row['company_id'];
				$title=$row['title'];
				$jobtype=$row['internship'];
				$technical=$row['technical'];
				$job_url=$row['job_url'];
				
				$company_name=$row['company_name'];
				$company_url=$row['company_url'];
				$employees=$row['number_of_employees'];
				$category=$row['category'];
				$description=$row['description'];
				$founded=$row['founded_year'];
				$funding=$row['money_raised'];
				$blog=$row['blog_url'];
				$twitter=$row['twitter_name'];


				
				echo "<tr id='" . $job_id . "'>";
				echo "<td><a href='". $job_url . "'>" . $title . "</a></td>";
				
				if($jobtype==1) // Display job or internship based on technical toggle in tables 
				{
					echo "<td value='1'>Intern</td>";
				}
					else
				{
					echo "<td value='0'>Job</td>";
  
				}
				
				if($technical==1) //  on technical toggle  
				{
					echo "<td value='1'>Yes</td>";
				}
					else
				{
					echo "<td value='0'>No</td>";
  
				}
				echo "<td><a href='". $company_url . "'>" . $company_name . "</a> - " . $description;
				if($twitter!=null)
				{
				echo "<br> <a href='http://www.twitter.com/" . $twitter . "'><img src='http://www.cisco.com/assets/x/i/icon_twitter_c.c.png' heigh='12px' width='12px' alt='Twitter'></img></a> ";
				}
				else
				{

				}
				if($blog!=null)
				{
				echo " - <a href='" . $blog . "'>Blog</a>";
				}
				else
				{

				}
				echo "</td>";


				if($founded==0) // show n/a if no year founded available 
				{
					echo "<td>?</td>";
				}
					else
				{
					echo "<td>" . $founded . "</td>";
  
				}
				
				if($employees==0) // show n/a if no employee info available 
				{
					echo "<td value='1'>?</td>";
				}
					else
				{
					echo "<td value='0'>" . $employees . "</td>";
  
				}
				if($funding==null) // show n/a if no funding info available 
				{
					echo "<td value='1'>?</td>";
				}
					else
				{
					echo "<td value='0'>" . $funding . "</td>";
  
				}







				echo "</tr>"


				?>								
		<? } ?> 		
