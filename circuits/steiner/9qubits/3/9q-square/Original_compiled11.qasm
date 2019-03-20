// Initial wiring: [1 0 2 3 4 6 5 7 8]
// Resulting wiring: [1 0 2 4 3 6 5 7 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[8];
cx q[3], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[5], q[4];
cx q[1], q[4];
