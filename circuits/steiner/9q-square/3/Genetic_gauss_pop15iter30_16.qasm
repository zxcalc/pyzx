// Initial wiring: [0 1 2 8 4 5 6 3 7]
// Resulting wiring: [0 1 2 8 4 5 6 3 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[6], q[5];
cx q[2], q[3];
