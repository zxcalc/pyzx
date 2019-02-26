// Initial wiring: [5, 3, 8, 7, 6, 4, 0, 1, 2]
// Resulting wiring: [5, 3, 8, 7, 6, 4, 0, 1, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[1], q[4];
cx q[0], q[1];
cx q[4], q[7];
cx q[3], q[4];
cx q[2], q[3];
cx q[1], q[4];
cx q[3], q[4];
cx q[3], q[8];
cx q[6], q[5];
cx q[7], q[4];
cx q[4], q[3];
cx q[3], q[2];
cx q[4], q[3];
cx q[7], q[4];
cx q[3], q[4];
cx q[4], q[7];
