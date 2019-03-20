// Initial wiring: [0, 7, 8, 3, 1, 2, 4, 6, 5]
// Resulting wiring: [0, 7, 8, 3, 1, 2, 4, 6, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[7];
cx q[7], q[8];
cx q[3], q[2];
cx q[4], q[3];
cx q[4], q[1];
