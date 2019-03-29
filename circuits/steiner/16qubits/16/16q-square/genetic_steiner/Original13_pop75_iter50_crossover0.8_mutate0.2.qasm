// Initial wiring: [7, 4, 15, 3, 8, 9, 10, 6, 5, 0, 14, 12, 1, 11, 2, 13]
// Resulting wiring: [7, 4, 15, 3, 8, 9, 10, 6, 5, 0, 14, 12, 1, 11, 2, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[1], q[0];
cx q[9], q[6];
cx q[10], q[5];
cx q[5], q[2];
cx q[2], q[1];
cx q[11], q[10];
cx q[14], q[13];
cx q[12], q[13];
cx q[7], q[8];
cx q[4], q[5];
cx q[3], q[4];
cx q[4], q[5];
cx q[5], q[4];
cx q[2], q[3];
cx q[1], q[2];
cx q[2], q[3];
cx q[3], q[4];
cx q[3], q[2];
