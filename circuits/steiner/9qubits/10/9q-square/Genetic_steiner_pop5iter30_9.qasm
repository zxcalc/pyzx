// Initial wiring: [7, 4, 8, 1, 3, 5, 2, 6, 0]
// Resulting wiring: [7, 4, 8, 1, 3, 5, 2, 6, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[3], q[4];
cx q[2], q[3];
cx q[1], q[4];
cx q[5], q[6];
cx q[0], q[5];
cx q[5], q[6];
cx q[3], q[8];
cx q[7], q[8];
cx q[2], q[3];
cx q[7], q[6];
cx q[2], q[1];
cx q[1], q[2];
cx q[1], q[0];
cx q[2], q[1];
cx q[1], q[2];
