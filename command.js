#!/usr/bin/env node
'use strict';

const ConnectorRunner = require('meshblu-connector-runner');
const MeshbluConfig   = require('meshblu-config');

const logger          = console;
logger.debug          = console.info;

console.log('DIRNAME', __dirname)
const connectorRunner = new ConnectorRunner({
  connectorPath: __dirname,
  meshbluConfig: new MeshbluConfig().toJSON(),
  logger: logger,
});

connectorRunner.run()
