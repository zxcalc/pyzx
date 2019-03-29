// Initial wiring: [8, 1, 9, 0, 7, 6, 15, 5, 18, 17, 11, 19, 12, 14, 16, 4, 10, 2, 3, 13]
// Resulting wiring: [8, 1, 9, 0, 7, 6, 15, 5, 18, 17, 11, 19, 12, 14, 16, 4, 10, 2, 3, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[10];
cx q[13], q[6];
cx q[18], q[19];
cx q[13], q[15];
cx q[7], q[12];
cx q[6], q[7];
cx q[0], q[9];
