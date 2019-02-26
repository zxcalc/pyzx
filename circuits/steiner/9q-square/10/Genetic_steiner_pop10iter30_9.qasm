// Initial wiring: [0, 4, 1, 3, 7, 6, 2, 8, 5]
// Resulting wiring: [0, 4, 1, 3, 7, 6, 2, 8, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[2], q[3];
cx q[1], q[2];
cx q[4], q[5];
cx q[5], q[6];
cx q[4], q[5];
cx q[7], q[8];
cx q[4], q[7];
cx q[7], q[8];
cx q[7], q[4];
cx q[4], q[7];
cx q[4], q[1];
cx q[7], q[4];
cx q[2], q[1];
cx q[4], q[7];
cx q[1], q[0];
cx q[5], q[0];
cx q[2], q[1];
