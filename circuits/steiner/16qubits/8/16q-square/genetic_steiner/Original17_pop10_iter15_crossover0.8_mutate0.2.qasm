// Initial wiring: [7, 10, 1, 4, 13, 9, 11, 14, 5, 0, 6, 8, 15, 12, 3, 2]
// Resulting wiring: [7, 10, 1, 4, 13, 9, 11, 14, 5, 0, 6, 8, 15, 12, 3, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[4], q[3];
cx q[5], q[2];
cx q[9], q[6];
cx q[10], q[5];
cx q[5], q[2];
cx q[10], q[5];
cx q[11], q[4];
cx q[4], q[3];
cx q[11], q[4];
cx q[12], q[13];
cx q[11], q[12];
cx q[12], q[13];
cx q[6], q[7];
cx q[2], q[5];
