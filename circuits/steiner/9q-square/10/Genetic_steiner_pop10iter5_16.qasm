// Initial wiring: [7, 2, 1, 3, 5, 4, 0, 8, 6]
// Resulting wiring: [7, 2, 1, 3, 5, 4, 0, 8, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[3], q[4];
cx q[2], q[3];
cx q[6], q[7];
cx q[8], q[7];
cx q[8], q[3];
cx q[7], q[8];
cx q[3], q[2];
cx q[4], q[3];
cx q[5], q[0];
cx q[4], q[5];
cx q[3], q[4];
cx q[2], q[3];
