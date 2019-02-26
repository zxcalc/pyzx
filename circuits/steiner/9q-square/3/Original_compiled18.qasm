// Initial wiring: [0 2 1 3 5 4 7 6 8]
// Resulting wiring: [0 2 1 3 5 4 7 6 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[0], q[5];
cx q[5], q[6];
