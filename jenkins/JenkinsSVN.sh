def projectName = "Portal.UnitTest"
def BuildVersion = "1.0.0"
def svnProjectPath = "https://code.concordfax.com/repos/archive/BlueRibbonIP/code/web/Portal/branches/portal-unit-testing/Portal"

pipeline {
  agent 
	{ 
	    label 'vs15'
    }

  stages {
    stage('PreCleanup'){
		  steps {
			  cleanWs()
		  }
	  }
    stage('CheckOut') {
      steps 
		{
			withCredentials([usernamePassword(credentialsId: 'e3d621cb-87bd-4f91-8818-8e6b0cd074ee', passwordVariable: 'SVNPassword', usernameVariable: 'SVNUserName')])
            {
				bat label: "SVN checkout", script: "svn checkout ${svnProjectPath} . --username \"${SVNUserName}\" --password \"${SVNPassword}\" --non-interactive"
            }
		}
    }
     
    stage('Install Dependencies') {
      steps {
        bat 'npm start'
      }
    }  

    stage('Run Unit Test') {
      steps {
        bat 'npm test'
        junit testResults: 'coverage/TESTS.xml', skipPublishingChecks: false
      }
    } 
    stage('CleanUp') {
        steps {
            cleanWs()
        }
    }
  }
  post { 
        failure { 
            junit testResults: 'coverage/TESTS.xml', skipPublishingChecks: false
        }
    }
}