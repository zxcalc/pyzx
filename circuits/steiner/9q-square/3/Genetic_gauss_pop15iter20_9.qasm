// Initial wiring: [0 1 2 3 4 6 5 7 8]
// Resulting wiring: [0 1 2 3 4 6 5 7 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[1];
cx q[4], q[5];
cx q[0], q[5];
