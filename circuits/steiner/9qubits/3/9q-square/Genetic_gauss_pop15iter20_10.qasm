// Initial wiring: [0 2 1 3 4 6 7 5 8]
// Resulting wiring: [0 1 2 3 4 6 7 5 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[1], q[0];
cx q[1], q[2];
cx q[1], q[2];
cx q[1], q[2];
cx q[0], q[1];
