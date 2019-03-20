// Initial wiring: [7, 1, 3, 0, 2, 5, 6, 4, 8]
// Resulting wiring: [7, 1, 3, 0, 2, 5, 6, 4, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[3], q[8];
cx q[2], q[3];
cx q[1], q[2];
cx q[3], q[8];
cx q[7], q[6];
cx q[6], q[5];
cx q[1], q[0];
