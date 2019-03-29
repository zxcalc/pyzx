// Initial wiring: [7, 2, 9, 15, 11, 4, 0, 5, 14, 1, 3, 12, 10, 8, 6, 13]
// Resulting wiring: [7, 2, 9, 15, 11, 4, 0, 5, 14, 1, 3, 12, 10, 8, 6, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[0];
cx q[5], q[0];
cx q[8], q[2];
cx q[10], q[2];
cx q[11], q[8];
cx q[9], q[4];
cx q[10], q[5];
cx q[14], q[7];
cx q[6], q[12];
cx q[5], q[13];
cx q[2], q[5];
cx q[2], q[3];
cx q[1], q[4];
cx q[5], q[10];
