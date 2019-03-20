// Initial wiring: [1, 3, 0, 8, 7, 6, 4, 5, 2]
// Resulting wiring: [1, 3, 0, 8, 7, 6, 4, 5, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[6], q[7];
cx q[3], q[8];
cx q[5], q[0];
cx q[6], q[5];
