// Initial wiring: [1 0 2 3 4 5 6 7 8]
// Resulting wiring: [1 0 2 3 4 5 6 7 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[4];
cx q[1], q[4];
cx q[6], q[5];
