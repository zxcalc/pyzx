// Initial wiring: [0, 8, 2, 3, 7, 5, 4, 6, 1]
// Resulting wiring: [0, 8, 2, 3, 7, 5, 4, 6, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[1], q[2];
cx q[7], q[8];
cx q[6], q[7];
cx q[6], q[5];
