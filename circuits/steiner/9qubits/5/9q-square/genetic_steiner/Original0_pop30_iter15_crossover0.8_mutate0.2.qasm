// Initial wiring: [1, 7, 4, 5, 6, 8, 0, 2, 3]
// Resulting wiring: [1, 7, 4, 5, 6, 8, 0, 2, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[5], q[4];
cx q[5], q[0];
cx q[6], q[7];
cx q[3], q[8];
