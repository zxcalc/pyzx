// Initial wiring: [0 1 2 5 7 4 6 3 8]
// Resulting wiring: [0 1 2 5 7 3 6 4 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[2], q[1];
cx q[3], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[5], q[0];
cx q[1], q[4];
cx q[8], q[7];
