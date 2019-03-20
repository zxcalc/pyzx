// Initial wiring: [8, 2, 7, 3, 5, 0, 6, 1, 4]
// Resulting wiring: [8, 2, 7, 3, 5, 0, 6, 1, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[5], q[6];
cx q[6], q[7];
cx q[7], q[4];
cx q[6], q[7];
cx q[2], q[1];
