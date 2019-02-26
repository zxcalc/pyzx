// Initial wiring: [0 1 2 8 4 6 3 7 5]
// Resulting wiring: [0 1 2 8 4 6 3 7 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[0], q[5];
cx q[3], q[4];
