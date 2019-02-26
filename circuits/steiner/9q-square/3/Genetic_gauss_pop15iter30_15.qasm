// Initial wiring: [0 1 3 8 2 5 6 7 4]
// Resulting wiring: [0 1 3 8 2 5 6 7 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[1];
cx q[0], q[5];
cx q[3], q[4];
