// Initial wiring: [10, 17, 7, 3, 13, 11, 8, 9, 12, 4, 18, 1, 6, 14, 16, 15, 19, 5, 0, 2]
// Resulting wiring: [10, 17, 7, 3, 13, 11, 8, 9, 12, 4, 18, 1, 6, 14, 16, 15, 19, 5, 0, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[3];
cx q[16], q[15];
cx q[18], q[11];
cx q[11], q[12];
cx q[8], q[10];
cx q[6], q[13];
cx q[5], q[14];
cx q[2], q[7];
