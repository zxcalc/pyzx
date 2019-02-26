// Initial wiring: [0 4 2 3 7 5 6 1 8]
// Resulting wiring: [0 4 2 3 7 5 6 1 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[5], q[6];
cx q[0], q[5];
