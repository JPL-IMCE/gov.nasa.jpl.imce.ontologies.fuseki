#!/usr/bin/env groovy

pipeline {
	/* Agent directive is required. */
	agent { node { label 'imce-infr-dev-01.jpl.nasa.gov' } } 

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
