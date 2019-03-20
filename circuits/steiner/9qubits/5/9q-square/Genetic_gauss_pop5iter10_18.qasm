// Initial wiring: [0 1 2 8 4 5 6 7 3]
// Resulting wiring: [0 3 2 4 1 5 6 7 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[2], q[3];
cx q[8], q[3];
cx q[8], q[3];
cx q[8], q[3];
cx q[1], q[0];
cx q[1], q[4];
cx q[1], q[4];
cx q[2], q[1];
cx q[3], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[2], q[3];
