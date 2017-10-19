#!/usr/bin/env groovy

pipeline {
	/* Agent directive is required. */
	agent { node { label 'imce-infr-dev-01.jpl.nasa.gov' } } 

	environment {
		PATH = '/home/jenkins/.rvm/gems/jruby-1.7.19/bin:/home/jenkins/.rvm/gems/jruby-1.7.19@global/bin:/home/jenkins/.rvm/rubies/jruby-1.7.19/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/jenkins/.rvm/bin'
	}

	stages {
		stage('Checkout') {
			steps {
				/* This will clone the specific revision which triggered this Pipeline run. */
				checkout scm
			}
		}

		stage('Setup Fuseki') {
			steps {
				echo "Setting up environment..."

				sh "env"

				sh "sbt setupFuseki"

				// setup Fuseki, ontologies, tools, environment
			}
		}

		stage('Start Fuseki') {
			steps {
				echo "Validating ontologies and loading into Fuseki..."

				sh "cd workflow; source ./env.sh; /usr/bin/make start-fuseki"
				// run makefile command, same for others below
			}
		}
	}
}
