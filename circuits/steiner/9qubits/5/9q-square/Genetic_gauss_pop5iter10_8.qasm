// Initial wiring: [0 1 2 3 4 5 6 7 8]
// Resulting wiring: [0 2 1 4 8 5 6 7 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[3], q[8];
cx q[3], q[8];
cx q[3], q[8];
cx q[3], q[2];
cx q[2], q[1];
cx q[2], q[1];
cx q[0], q[1];
cx q[5], q[4];
