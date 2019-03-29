// Initial wiring: [15, 0, 13, 1, 7, 11, 16, 4, 2, 6, 14, 12, 9, 3, 19, 18, 10, 17, 8, 5]
// Resulting wiring: [15, 0, 13, 1, 7, 11, 16, 4, 2, 6, 14, 12, 9, 3, 19, 18, 10, 17, 8, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[7];
cx q[11], q[10];
cx q[11], q[9];
cx q[13], q[7];
cx q[18], q[12];
cx q[18], q[19];
cx q[11], q[12];
cx q[2], q[7];
